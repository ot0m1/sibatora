# frozen_string_literal: true

require './shibatora'
require './shibatora_waf'

use ShibatoraWaf
run Shibatora.new
