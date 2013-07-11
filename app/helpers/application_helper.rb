module ApplicationHelper
  def notification_method(id)
    methods = {
      "1" => "None",
      "2" => "Email",
      "3" => "Text Message",
      "4" => "Text & Email"
    }
    return methods[id]
  end
end
