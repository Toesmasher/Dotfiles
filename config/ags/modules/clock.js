const date = Variable("", {
    poll: [1000, 'date "+%Y-%m-%d %H:%M"'],
})

export function Clock() {
  const clock = () => Widget.Label({
    label: date.bind(),
  })

  return Widget.Box({
    class_name: "clock_box",
    children: [
      clock()
    ]
  })
}
