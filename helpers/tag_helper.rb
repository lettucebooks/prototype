module TagHelper

  # Display IcoMoon font icon
  def icon key
    "<i data-icon=&#x#{h(key)}></i>"
  end

  # SVG image with PNG fallback
  def svg_image_tag filename, options = {}
    filename.gsub! /\.svg$/i, ""
    png = image_path "#{filename}.png"
    options["onerror"] = "this.src='#{png}'"
    image_tag "#{filename}.svg", options
  end

end
