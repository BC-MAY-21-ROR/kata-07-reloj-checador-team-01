module ApplicationHelper
  def render_svg(name, styles:"fill-current text-red-400 icon-sm", title:nil)
    filename = "#{name}.svg"
    title ||= name.underscore.humanize
    inline_svg_tag("icons/#{filename}", aria: true, nocomment:true, title: title, class: styles)
  end

  def pluralize_without_count(count, noun, text = nil)
    if count != 0
      count == 1 ? "#{noun}#{text}" : "#{noun.pluralize}#{text}"
    end
  end
end
