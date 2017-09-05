require 'reactrb/auto-import'
require 'active_support'
require 'browser/interval'
require 'browser/delay'
require 'opal-jquery'

module Hyperloop
  class Component
    VERSION = "0.12.4"
  end
end

# following to stop HyperRouter complaining
`if( eval(ReactRouter) == 'undefined') { ReactRouter = function() {} };`
`if( eval(ReactRouterDOM) == 'undefined') { ReactRouterDOM = function() {} };`

require 'hyper-component'
require 'hyper-operation'
require 'hyper-store'
require 'hyper-router'
require 'react/top_level_render'
