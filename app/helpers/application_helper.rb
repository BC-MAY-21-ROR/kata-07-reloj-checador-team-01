module ApplicationHelper
  def render_svg(name, styles:"fill-current text-red-400 icon-sm", title:nil)
    filename = "#{name}.svg"
    title ||= name.underscore.humanize
    inline_svg_tag("icons/#{filename}", aria: true, nocomment:true, title: title, class: styles)
  end
end
