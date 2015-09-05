# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'gameOver', =>
      console.log "gameOver triggered"
      @restart()
    @get('dealerHand').on 'gameOver', =>
      console.log "gameOver triggered"
      @restart()

  restart: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'gameOver', =>
      console.log "gameOver triggered"
      @restart()
    @get('dealerHand').on 'gameOver', =>
      console.log "gameOver triggered"
      @restart()

  stand: ->    
    @get('dealerHand').at(0).flip()

    while @get('dealerHand').bestScore() < 17
      @get('dealerHand').hit()

    playerScore = @get('playerHand').bestScore()
    dealerScore = @get('dealerHand').bestScore()
    if dealerScore > 21
      alert "Dealer busts"
    else if playerScore > dealerScore
      alert "YOU WIN!!!"
    else if dealerScore > playerScore
      alert "Dealer wins"
    else if playerScore == dealerScore
      alert "It's a push"

    @restart()