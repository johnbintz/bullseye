Bullseye.configure do |c|
  c.js_controller_search = %{$('body').data('controller')}
  c.js_action_search = %{$('body').data('action')}

  c.css_selector = %{body[data-action=':action'][data-controller=':controller']}
  c.html_tag = { 'data-action' => ':action', 'data-controller' => ':controller' }

  c.fuzzy_search = false
end
