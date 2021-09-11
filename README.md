![](https://img.shields.io/badge/Microverse-blueviolet)

<br />
<p align="center">
  <a href="https://github.com/crgc/tic-tac-toe">
    <img src="img/screenshot.png" alt="Logo">
  </a>

  <h3 align="center">Tic-Tac-Toe</h3>

  <p align="center">
    This project is part of the Microverse Ruby Module.
    <br />
    <a href="https://github.com/crgc/tic-tac-toe/issues">Report Bug</a>
    ·
    <a href="https://github.com/crgc/tic-tac-toe/issues">Request Feature</a>
  </p>
</p>

## Table of Contents

* [About the Game](#about-the-game)
  * [Installation](#installation)
  * [Run](#run)
  * [Instructions](#instructions)
  * [Testing](#testing)
  * [Built With](#built-with)
* [Authors](#authors)

## About The Game

Tic-tac-toe (US), noughts and crosses (UK), or Xs and Os is a paper-and-pencil game for two players, X and O, who take turns marking the spaces in a 3×3 grid. The player who succeeds in placing three of their marks in a horizontal, vertical, or diagonal row is the winner.

Game Rules:

1. Two player game
2. First player plays with the 'O' symbol
3. Second player plays with the 'X' symbol
4. Players take turns choosing a cell of the board to mark their symbol.
5. A player can only choose an empty cell.
6. The first player to complete a succession of 3 of their assigned symbol (O's or X's) in a row, column or diagonal wins!
7. If all of the cells are filled with a symbol and no player matched 3 symbols, the game ends in a tie.

## Installation

* Clone this repository
```
git clone https://github.com/crgc/tic-tac-toe.git
```
* Change into folder
```
cd tic-tac-toe
```

## Run

* Run the following command
```
bin/main.rb
```

## Instructions

Once you run the game, follow the prompts and instructions inside the terminal. 

1. You will be prompted to type the Player 1 name and Player 2 name (press enter after each name)
2. The first player will pick between the 'X' and 'O' symbol
3. The second player will play with the unpicked symbol
4. The game will prompt which player turn's it is
5. The player in turn should type a valid cell name (1-9) and enter it to mark the board
6. After each turn, you will see the updated board with the selections of the players. Example of a game board after the first player types in "2" in their turn:
    ```
       [ ][X][ ]
       [ ][ ][ ]
       [ ][ ][ ]
    ```
7. A player can only mark an empty cell. If they choose a cell that is already marked, they will be prompted again
8. The first player to match a succession of 3 of their assigned symbol - in row, column, or diagonal pattern - wins
9. If all cells are marked and no player matched 3, the game ends in a tie

### Testing

* To run the RSpec tests, run the following commands:

```
bundle install
```
```
bundle exec rspec
```

## Built With

- Ruby
- RubyMine

## Authors

👤  **Carlos González**
- GitHub: [@crgc](https://github.com/crgc)
- Twitter: [@aclerkofpomier](https://twitter.com/aclerkofpomier)
- LinkedIn: [Carlos González](https://www.linkedin.com/in/carlosrmgonzalez/)

👤  **Miguel Gómez**
- GitHub: [@MiguelArgentina](https://github.com/MiguelArgentina)
- Twitter - [@Qete_arg](https://twitter.com/Qete_arg)
- LinkedIn: [Miguel Gómez](https://www.linkedin.com/in/miguelricardogomez/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/crgc/tic-tac-toe/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://www.mit.edu/~amini/LICENSE.md) licensed.
