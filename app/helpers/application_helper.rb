# -*- coding:utf-8 *-*
module ApplicationHelper

  # 生成一个与当前语言不同的链接地址
  def language_link
    # 这里最好是用循环来读取语言页的内容
    # 然后以下拉的形式展示语言，下边的实现偷懒了，只确认实现中文，英文即可
    session['I18n'] ||= ""
    if session['I18n'].downcase == "en"
      "#{link_to '中文', set_language_path('zh-CN') }".html_safe
    else
      "#{link_to 'English', set_language_path('en') }".html_safe
    end
  end

  def display_menu
    @menu = Category.order("sort").where("level < 2")
    haml_tag :ul, :class=>'sf-menu' do
      gen_main_menu(@menu)
    end
  end

  def gen_main_menu(menus)
    menus.each do |m|
      if m.level == 0
        haml_tag :li do
          haml_concat "#{link_to m.title, '#'}"
          gen_sub_menu(menus,m)
        end
      end
    end
  end

  def gen_sub_menu(all_menus, parent_menu)
    haml_tag :ul do
      haml_tag :li do
        all_menus.each do |m|
          if m.parent_id == parent_menu.id
            haml_concat "#{link_to m.title, '#'}"
          end
        end
      end
    end
  end

end
