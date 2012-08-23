#= require jquery

this.Bullseye = {
  target: function(controller, action, callback) {
    this.targets = (this.targets || {});
    this.targets[controller] = (this.targets[controller] || {});
    this.targets[controller][action] = callback;
  },

  exec: function(controller, action) {
    if (this.targets[controller] && this.targets[controller][action]) {
      this.targets[controller][action].apply(this.context);
    }
  }
};

Bullseye.context = this;

$(function() {
  var controller = $('body').data('controller');
  var action = $('body').data('action');

  Bullseye.exec(controller, action);
});
