module ApplicationHelper

  def header
    str = ''
    if @page  
      str += content_tag(:title, @page.title)
      str += content_tag(:meta, nil, name: "keywords", content: @page.keywords)
      str += content_tag(:meta, nil, name: "description", content: @page.description)
    elsif @galery  
      str += content_tag(:title, @galery.site.alias + ' - ' + @galery.title)
      str += content_tag(:meta, nil, name: "keywords", content: @galery.keywords)
      str += content_tag(:meta, nil, name: "description", content: @galery.description)
    end
    raw(str)
  end

  def sub_menu(list_tag)
    str = "<#{list_tag}>"
    Page.where(sub_menu: true, visible: true, site_id: Site.current_site_id).roots.each do |page|
      title = ''
      content = ''      

      if page.body.blank?
        title += content_tag(:h2, page.name)
      else
        current_page?(page_link_path(page.slug)) == true ? klass = 'current' : klass = ''
        title += content_tag(:h2, link_to(page.name, page_link_path(page.slug), title: truncate(page.description, length: 100, ommission: '...'), class: klass))
      end

      unless page.children.empty?
        content += '<ul>'
        page.children.each do |child|
          current_page?(page_link_path(child.slug)) == true ? klass = 'current' : klass = ''
          content += content_tag(:li, link_to(child.name, page_link_path(child.slug), title: truncate(child.description, length: 100, ommission: '...'), class: klass), class: klass)
        end
        content += '</ul>'
      end

      if list_tag == 'ul'
        str += content_tag(:li, raw(title) + raw(content))
      elsif list_tag == 'li'
        str += raw(title) + raw(content)
      else
        str += raw(title) + raw(content)
      end

    end
    str += "</#{list_tag}>"
    #%li= link_to menu.title, page_link_path(menu.slug), title: truncate(menu.description, length: 100, ommission: '...'), class:"#{'current' if current_page?(page_link_path(menu.slug))}"
    raw(str)
  end

  def fancybox_script
    str = ''
    str += javascript_include_tag '/assets/jquery-1.6.3.js'
    str += javascript_include_tag '/assets/fancybox/jquery.easing-1.3.js'
    str += javascript_include_tag '/assets/fancybox/jquery.fancybox.pack.js'
    str += javascript_include_tag '/assets/fancybox.js'
    str += stylesheet_link_tag '/assets/fancybox/jquery.fancybox.css'
    str += stylesheet_link_tag '/assets/fancybox/jquery.fancybox-buttons.css'
    str += stylesheet_link_tag '/assets/fancybox/jquery.fancybox-thumbs.css'
    raw(str)
  end

  def attachment_script
    str = ''
    str += javascript_tag(
      "jQuery(document).ready(function(){" +
       "$('a[_cke_saved_href]').each(function(){" +
          "var lCkeSavedHref = jQuery(this).attr('_cke_saved_href');" +
          "lCkeSavedHref = lCkeSavedHref.replace('http://', '');" +
          "lCkeSavedHref = '#{request.protocol}#{request.host_with_port}/' + lCkeSavedHref;" +
          "this.href = lCkeSavedHref;" +
        "});" +
      "});"
    )
    raw(str)
  end

  def price_with_delivery(city, width)
    volume = width/1000
    return Delivery::Autotrading.delivery_price('voronezh', city, width.to_f, volume.to_f).to_f.round(2)
  end

end
