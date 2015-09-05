# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  stand: ->    
    # (optional) hit dealer until (player score < dealer score < 22)
    @get('dealerHand').at(0).flip()
    playerScore = @get('playerHand').bestScore()
    dealerScore = @get('dealerHand').bestScore()
    if playerScore > dealerScore
      alert "YOU WIN!!!"
    else if dealerScore > playerScore
      alert "Dealer wins"
    else if playerScore == dealerScore
      alert "It's a push"
    else 
      alert "Something is wrong"