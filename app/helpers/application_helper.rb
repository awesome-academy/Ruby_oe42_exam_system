module ApplicationHelper
  def full_title page_title
    base_title = t("base_title")
    page_title.empty? ? base_title : [page_title, base_title].join(" | ")
  end

  def toastr_flash type
    case type
    when "alert"
      "toastr.error"
    when "notice"
      "toastr.success"
    else
      "toastr.info"
    end
  end
end
