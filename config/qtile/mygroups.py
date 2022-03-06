from libqtile.config import Group

__groups = [
  Group("1"),
  Group("2"),
  Group("3"),
  Group("4"),
  Group("5", layout = "VerticalTile"),
]

def get_groups():
    return __groups
