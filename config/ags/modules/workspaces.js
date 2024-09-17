const hyprland = await Service.import("hyprland")

export function range(i) {
  return [...Array(i).keys()]
}

export function Workspaces() {
  const workspaceLabel = (id) => {
    const workspaceIcons = {
      1: "", 
      6: "", 
      8: "󰭹",
      9: "" 
    };

    return Widget.Label(workspaceIcons[id] ?? "");
  }

  const workspaceButtons = () => range(9).map((i) => {
    let b = Widget.Button({
      on_clicked: () => hyprland.messageAsync(`dispatch workspace ${i + 1}`),
      child: workspaceLabel(i + 1),
      setup: (button) => {
        button.hook(hyprland.active.workspace, () => {
          button.toggleClassName("active", hyprland.active.workspace.id == i + 1)
        })
      }
    })
    return b
  })

  return Widget.Box({
    class_name: "workspaces",
    children: workspaceButtons()
  })
}
