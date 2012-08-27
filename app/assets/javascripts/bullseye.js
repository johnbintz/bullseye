#= require jquery

this.Bullseye = {
  target: function(controller, action, callback) {
    this.targets[controller] = (this.targets[controller] || {});
    this.targets[controller][action] = callback;
  },

  targets: {},

  exec: function(controller, action) {
    if (this.targets[controller] && this.targets[controller][action]) {
      this.targets[controller][action].apply(this.context);
    }
  }
};

Bullseye.context = this;

$(function() {
  Bullseye.exec($('body').data('controller'), $('body').data('action'));
});
