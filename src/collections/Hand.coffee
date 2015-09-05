class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    if @minScore() > 21
      # if @isDealer
      #   alert 'Dealer busts. You win!'
      #   @trigger 'gameOver'
      #   # window.App.restart()
      # else
      #   alert 'You busted! You lose.'
      #   @trigger 'gameOver'
      if not @isDealer
        alert('You busted! You lose.')
        @trigger 'gameOver'

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1 and card.get 'revealed'
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + (10 * @hasAce())]

  bestScore: ->
    if @scores()[1] <= 21 then @scores()[1] else @scores()[0]

