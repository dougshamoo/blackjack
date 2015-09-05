# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  stand: ->    
    # (optional) hit dealer until (player score < dealer score < 22)
    # decide player score
    # playerScore = @get('playerHand').scores()[1]
    @get('dealerHand').at(0).flip()
    playerScore = if @get('playerHand').scores()[1] <= 21 then @get('playerHand').scores()[1] else @get('playerHand').scores()[0];
    dealerScore = if @get('dealerHand').scores()[1] <= 21 then @get('dealerHand').scores()[1] else @get('dealerHand').scores()[0];
    if playerScore > dealerScore
      alert "YOU WIN!!!"
    else if dealerScore > playerScore
      alert "Dealer wins"
    else if playerScore == dealerScore
      alert "It's a push"
    else 
      alert "Something is wrong"
    
    console.log playerScore
    console.log dealerScore
    # alert playerScore
    # decide dealer score
    # compare scores
    # alert winner