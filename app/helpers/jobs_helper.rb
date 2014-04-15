module JobsHelper
  def job_type(job)
    if job.is_fulltime?
      return '<span class="label radius">正職</span>'.html_safe
      # content_tag(:span, class: "label radius",  "正職")
    else
      return '<span class="label radius success">實習</span>'.html_safe
      # content_tag(:span, class: "label success radius",  "實習")
    end
  end
end
