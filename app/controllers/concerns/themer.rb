# frozen_string_literal: true

# BigBlueButton open source conferencing system - http://www.bigbluebutton.org/.
#
# Copyright (c) 2018 BigBlueButton Inc. and by respective authors (see below).
#
# This program is free software; you can redistribute it and/or modify it under the
# terms of the GNU Lesser General Public License as published by the Free Software
# Foundation; either version 3.0 of the License, or (at your option) any later
# version.
#
# BigBlueButton is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with BigBlueButton; if not, see <http://www.gnu.org/licenses/>.

module Themer
  extend ActiveSupport::Concern

  # Lightens a color by 40%
  def color_lighten(color)
    # Uses the built in Sass Engine to lighten the color

    dummy_scss = "h1 { color: $lighten; }"
    compiled = Sass::Engine.new("$lighten:lighten(#{color}, 40%);" + dummy_scss, syntax: :scss).render

    string_locater = 'color: '
    color_start = compiled.index(string_locater) + string_locater.length

    compiled[color_start..color_start + 6]
  end

  # Darkens a color by 10%
  def color_darken(color)
    # Uses the built in Sass Engine to darken the color

    dummy_scss = "h1 { color: $darken; }"
    compiled = Sass::Engine.new("$darken:darken(#{color}, 10%);" + dummy_scss, syntax: :scss).render

    string_locater = 'color: '
    color_start = compiled.index(string_locater) + string_locater.length

    compiled[color_start..color_start + 6]
  end
end
