var Dispatcher = function(attributes) {
  this.url = attributes.url;
  this.methodType = attributes.methodType || 'GET';
  this.data = attributes.data;
  this.successCallback = attributes.successCallback;
  this.errorCallback = attributes.errorCallback;
}

Dispatcher.prototype.sendRequest = function() {
  var _this = this;
  $.ajax({
    url: _this.url,
    type: _this.methodType,
    data: _this.data,
  }).success(function(data) {
    _this.successCallback(data);
  }).error(function(data) {
    _this.errorCallback(data.responseJSON);
  })
}

Dispatcher.createAndSendRequest = function(attributes) {
  var dispatcher = new Dispatcher(attributes);
  dispatcher.sendRequest();
}