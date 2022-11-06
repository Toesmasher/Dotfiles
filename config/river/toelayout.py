from argparse import ArgumentParser

from pywayland.client import Display
from pywayland.protocol.wayland import WlOutput
try:
    from pywayland.protocol.river_layout_v3 import RiverLayoutManagerV3
except:
    river_layout_help = """
    Your pywayland package does not have bindings for river-layout-v3.
    You can generate the bindings with the following command:
         python3 -m pywayland.scanner -i /usr/share/wayland/wayland.xml river-layout-v3.xml
    It is recommended to use a virtual environment to avoid modifying your
    system-wide python installation, See: https://docs.python.org/3/library/venv.html
    """
    print(river_layout_help)
    quit()

layout_manager = None
outputs = []
loop = True

main_ratio_single = 0.6
main_ratio_double = 0.4
gaps_inner = 0
gaps_outer = 0
triple_column_min_width = 3000

def handle_demand(layout, view_count, usable_w, usable_h, tags, serial):
    stack_views = view_count - 1

    if view_count == 0:
        pass

    elif usable_h > usable_w:
        # Output is standing screen, use even horizontal layout
        x = gaps_outer
        y = gaps_outer
        w = usable_w - 2 * gaps_outer
        h = int((usable_h - 2 * gaps_outer - stack_views * gaps_inner)/view_count)

        for i in range(0, view_count):
            layout.push_view_dimensions(x, y, w, h, serial)
            y += (h + gaps_inner)

    else:
        if usable_w >= triple_column_min_width:
            num_stack_columns = min(view_count, 3) - 1
        else:
            num_stack_columns = min(view_count, 2) - 1

        # Get total width that's drawable
        gapped_w = usable_w - 2 * gaps_outer - num_stack_columns * gaps_inner
        if num_stack_columns == 0:
            main_w = gapped_w
        elif num_stack_columns == 1:
            main_w = int(gapped_w * main_ratio_single)
        elif num_stack_columns == 2:
            main_w = int(gapped_w * main_ratio_double)

        stack_w = 0 if num_stack_columns == 0 else int((gapped_w - main_w)/num_stack_columns)

        # Calculate everything except the main window width
        main_h = usable_h - 2 * gaps_outer
        main_x = gaps_outer if num_stack_columns < 2 else gaps_outer + stack_w + gaps_inner
        main_y = gaps_outer

        # Draw main window
        layout.push_view_dimensions(main_x, main_y, main_w, main_h, serial)

        if num_stack_columns == 0:
            pass

        elif num_stack_columns == 1:
            x = gaps_outer + main_w + gaps_inner
            y = gaps_outer
            h = int((usable_h - 2 * gaps_outer - stack_views * gaps_inner)/stack_views)
            for i in range(0, stack_views):
                layout.push_view_dimensions(x, y, stack_w, h, serial)
                y += (h + gaps_inner)

        elif num_stack_columns == 2:
            col_x = [ gaps_outer, gaps_outer + stack_w + gaps_inner + main_w + gaps_inner ]
            col_views = [ int(stack_views/2), stack_views - int(stack_views/2) ]

            for i in range(0, stack_views):
                col_idx = (i+1) % 2
                h = int((usable_h - 2 * gaps_outer - (col_views[col_idx] - 1) * gaps_inner)/col_views[col_idx])
                x = col_x[col_idx]
                y = gaps_outer + int(i/2) * (h + gaps_inner)

                layout.push_view_dimensions(x, y, stack_w, h, serial)

        else:
            print("WTF?")

    # Committing the layout means telling the server that your code is done
    # laying out windows. Make sure you have pushed exactly the right amount of
    # view dimensions, a mismatch is a fatal protocol error.
    #
    # You also have to provide a layout name. This is a user facing string that
    # the server can forward to status bars. You can use it to tell the user
    # which layout is currently in use. You could also add some status
    # information status information about your layout, which is what we do here.
    layout.commit(f"{view_count} windows laid out by python", serial)

def handle_user_command(layout, cmd):
    print(cmd)

def handle_namespace_in_use(layout):
    # Oh no, the namespace we choose is already used by another client! All we
    # can do now is destroy the layout object. Because we are lazy, we just
    # abort and let our cleanup mechanism destroy it. A more sophisticated
    # client could instead destroy only the one single affected layout object
    # and recover from this mishap. Writing such a client is left as an exercise
    # for the reader.
    print("Namespace already in use!")
    global loop
    loop = False

class Output(object):
    def __init__(self):
        self.output = None
        self.layout = None
        self.id = None

    def destroy(self):
        if self.layout is not None:
            self.layout.destroy()
        if self.output is not None:
            self.output.destroy()

    def configure(self):
        global layout_manager
        if self.layout is None and layout_manager is not None:
            # We need to set a namespace, which is used to identify our layout.
            self.layout = layout_manager.get_layout(self.output, "toelayout")
            self.layout.user_data = self
            self.layout.dispatcher["layout_demand"] = handle_demand
            self.layout.dispatcher["namespace_in_use"] = handle_namespace_in_use
            self.layout.dispatcher["user_command"] = handle_user_command

def registry_handle_global(registry, id, interface, version):
    global layout_manager
    global output
    if interface == 'river_layout_manager_v3':
        layout_manager = registry.bind(id, RiverLayoutManagerV3, version)
    elif interface == 'wl_output':
        output = Output()
        output.output = registry.bind(id, WlOutput, version)
        output.id = id
        output.configure()
        outputs.append(output)

def registry_handle_global_remove(registry, id):
    for output in outputs:
        if output.id == id:
            output.destroy()
            outputs.remove(output)

ap = ArgumentParser()
ap.add_argument("--main-ratio-single", "-s", required=False, dest="main_ratio_single", type=float, default=0.6, help="Main area ratio with single column stack")
ap.add_argument("--main-ratio-double", "-d", required=False, dest="main_ratio_double", type=float, default=0.4, help="Main area ratio with double column stack")
ap.add_argument("--gaps-inner", "-i", required=False, dest="gaps_inner", type=int, default=0, help="Inner gaps")
ap.add_argument("--gaps-outer", "-o", required=False, dest="gaps_outer", type=int, default=0, help="Outer gaps")
args = ap.parse_args()

main_ratio_single = args.main_ratio_single
main_ratio_double = args.main_ratio_double
gaps_inner = args.gaps_inner
gaps_outer = args.gaps_outer

display = Display()
display.connect()

registry = display.get_registry()
registry.dispatcher["global"] = registry_handle_global
registry.dispatcher["global_remove"] = registry_handle_global_remove

display.dispatch(block=True)
display.roundtrip()

if layout_manager is None:
    print("No layout_manager, aborting")
    quit()

for output in outputs:
    output.configure()

while loop and display.dispatch(block=True) != -1:
    pass

# Destroy outputs
for output in outputs:
    output.destroy()
    outputs.remove(output)

display.disconnect()
