var FantasyTeam = {
  init: function() {
    this.currentPlayersCountElement = $('#current-players-count');
    this.currentCostElement = $('#available-cost');
    this.teamContainer = $('#team');
    this.currentlySelectedPlayerElement = null;
    this.playerFromTeam = null;
    this.bindEvents();
  },

  bindEvents: function() {
    this.addPlayerListener();
    this.removePlayerListener();
  },
  
  addPlayerListener: function() {
    var _this = this;
    $('.add-player').click(function() {
      _this.currentlySelectedPlayerElement = $(this);
      Dispatcher.createAndSendRequest({
        url: Routes.addPlayerPath,
        data: { player_id: $(this).data('id') },
        methodType: 'POST',
        successCallback: _this.addPlayerSuccessCallback,
        errorCallback: _this.addPlayerFailureCallback
      });
    });
  },

  removePlayerListener: function() {
    var _this = this;
    $('body').on('click', '.remove-player', function() {
      _this.playerFromTeam = $(this).parent('div');
      _this.currentlySelectedPlayerElement = $('.right-container').find('li[data-id=' + $(this).data('player-id') +']');
      debugger
      Dispatcher.createAndSendRequest({
        url: Routes.removePlayerPath($(this).data('id')),
        methodType: 'DELETE',
        successCallback: _this.removePlayerSuccessCallback,
        errorCallback: function() {
          alert('Player could not be removed!!');
        }
      });
    });
  },

  addPlayerSuccessCallback: function(data) {
    FantasyTeam.changePlayerCount();
    FantasyTeam.changeAvailableCost(data.player.cost);
    FantasyTeam.addPlayerToTeamList(data);
    FantasyTeam.hideCurrentlySelectedPlayer();
  },

  addPlayerFailureCallback: function(data) {
    var error = ''
    for(key in data) {
      if (key != 'fantasy_team') {
        error += key + ': ' + data[key] + '\n\n';
      }
      if(key == 'formation_mismatch') {
        //use localiztion instead of hardcoding messages
        error += 'Allowed formations(batsmen - bowler - allrounder -wicketkeepr):- \n\n' +
                  '3-2-2-1\n\n3-3-1-1\n\n4-2-1-1'
      }
    }
    alert(error);
  },

  removePlayerSuccessCallback: function(data) {
    FantasyTeam.changePlayerCount('minus');
    FantasyTeam.changeAvailableCost(data.player.cost, 'minus');
    FantasyTeam.removePlayerFromTeamList();
    FantasyTeam.showCurrentlySelectedPlayer();
  },

  removePlayerFromTeamList: function() {
    $(this.playerFromTeam).remove();
  },

  changeAvailableCost: function(playerCost, method) {
    method = method || 'add'
    var cost = method == 'add' ? playerCost : (-1 * playerCost);
    var newCost = (parseFloat($(this.currentCostElement).text()) - cost).toFixed(1);
    $(this.currentCostElement).text(newCost);
  },

  changePlayerCount: function(type) {
    type = type || 'add'
    var number = type == 'add' ? 1 : -1
    var playersCount = parseInt($(this.currentPlayersCountElement).text()) + number;
    $(this.currentPlayersCountElement).text(playersCount + '/8');
  },

  addPlayerToTeamList: function(data) {
    var player = data.player;
    //Use templating for better development
    $(this.teamContainer).append($('<div>',
      {
        text: player.name + ' | ' + data.player_type + ' | ' + parseFloat(player.cost).toFixed(1) + 'm '
      }).append($('<span>', { class: 'remove-player', text: 'x', 'data-id': data.id, 'data-player-id': player.id }))
    )
  },

  hideCurrentlySelectedPlayer: function() {
    $(this.currentlySelectedPlayerElement).addClass('hidden');
  },

  showCurrentlySelectedPlayer: function() {
    $(this.currentlySelectedPlayerElement).removeClass('hidden');
  }
}

$(function() {
  FantasyTeam.init();
})