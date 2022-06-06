pragma solidity ^0.8.0;


contract CrazyEights {
    // The deck of cards
    Deck deck;
    // The player's hand
    Hand hand;
    // The current target number
    uint targetNumber;
    // The current player
    address currentPlayer;

    constructor(address _deck, address _hand) public {
        deck = Deck(_deck);
        hand = Hand(_hand);
    }

    // Function to start a new game
    function newGame() public {
        // Shuffle the deck
        deck.shuffle();
        // Deal 8 cards to each player
        for (uint i = 0; i < 8; i++) {
            for (uint j = 0; j < players.length; j++) {
                hand.dealCard(players[j], deck.drawCard());
            }
        }
        // Set the target number to 8
        targetNumber = 8;
        // Set the current player to the first player in the array
        currentPlayer = players[0];
    }

    // Function to play a card
    function playCard(uint cardIndex) public {
        // Make sure it is the player's turn
        require(msg.sender == currentPlayer);
        // Get the played card
        Card playedCard = hand.getCard(cardIndex);
        // Make sure the card is a valid play
        require(playedCard.number == targetNumber || playedCard.suit == "♠");
        // Play the card
        hand.playCard(cardIndex);
        // Check if the player has won
        if (hand.numCards() == 0) {
            emit GameOver(currentPlayer);
        } else {
            // Draw a card if the player cannot play
            if (playedCard.number != targetNumber) {
                hand.dealCard(currentPlayer, deck.drawCard());
            }
            // Advance to the next player
            currentPlayer = players[(playerIndex(currentPlayer) + 1) % players.length];
        }
    }

    // Function to end the game
    function endGame() public {
        emit GameOver(currentPlayer);
    }

    // Event to signal the end of the game
    event GameOver(address winner);
}
