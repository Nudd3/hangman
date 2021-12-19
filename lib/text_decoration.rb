# frozen_string_literal: false

# This module contains some methods for decorating text
module TextDecoration
  def color_code(color, text)
    {
      'red' => "\e[31m#{text}\e[0m ", # red
      'green' => "\e[32m#{text}\e[0m", # green
      'blue' => "\e[34m#{text}\e[0m"
    }[color]
  end

  def underline(text)
    "\e[4m#{text}\e[24m"
  end
end
