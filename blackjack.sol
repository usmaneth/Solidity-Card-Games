pragma solidity ^0.8.0;

contract Blackjack {
// Define our game rules here

// The player can bet up to 100 Ether on each hand
uint256 public betLimit = 100 ether;

// The dealer must hit on 16 and stand on all 17s
uint256 public dealerHitValue = 16;
uint256 public dealerStandValue = 17;

// The game is played with a standard deck of 52 cards
uint256 public deckSize = 52;

// The player can double down on any hand of 9, 10, or 11
uint256[] public doubleDownValues = [9, 10, 11];

// Aces are worth 1 or 11 points
uint256[] public aceValues = [1, 11];

// Face cards are worth 10 points
uint256[] public faceCardValues = [10];

// All other cards are worth their numeric value'

// Define our interface here
// Function to deal a card to a player
function dealCard(address player) external;

// Function to calculate the point value of a hand
function calculateHandValue(uint256[] hand) external view returns (uint256);

// Function to compare two hands and determine a winner
function compareHands(uint256[] hand1, uint256[] hand2) external view returns (address);

// Function to start a new hand
function newHand() external;

// Main function to start our game
function main() public {
  // Welcome our players!

  // Deal two cards to each player
  dealCard(msg.sender);
  dealCard(msg.sender);

  // Deal two cards to the dealer
  dealCard(this);
  dealCard(this);

  // Have the player make their move
  makePlayerMove();

  // Have the dealer make their move
  makeDealerMove();

  // Determine the winner
  address winner = compareHands(playerHand, dealerHand);

  // Pay out the winnings!
  if (winner == msg.sender) {
    msg.sender.transfer(betAmount);} 
    else if (winner == this) {
    this.transfer(betAmount);} 
    else {// It's a push! No one wins or loses.}

  // Start a new hand
    newHand();
}

// Function to have the player make their move
function makePlayerMove() public {

// The player can either hit or stand
// If the player hits, deal them another card
// If the player stands, do nothing

// Check if the player has gone over 21
  if (calculateHandValue(playerHand) > 21) {
    // The player busts! The dealer wins. 
     this.transfer(betAmount);
}
}

// Function to have the dealer make their move
function makeDealerMove() public {

// The dealer must hit on 16 and stand on all 17s
// If the dealer hits, deal them another card
// If thw dealer stands, do nothing

// Check if the dealer has gone over 21
if (calculateHandValue(dealerHand) > 21) {
  // The dealer busts! The player wins.
  msg.sender.transfer(betAmount);
}
}
}
