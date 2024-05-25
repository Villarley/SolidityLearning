//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
contract TicTacToe {
    struct Game {
        address player1;
        address player2;
        address winner;
        uint [4][4] plays;
        address lastShift; 
    }
    Game[] public games;

    function createGame(address play1, address play2 ) public returns(uint) {
        require(play1 != play2);
        uint idGame = games.length;
        Game memory game;
        game.player1 = play1;
        game.player2 = play2;
        games.push(game);
        return idGame;
    }
    function play(uint idGame, uint horizontal, uint vertical) public{
        //validate
        Game memory game = games[idGame];
        require(game.player1 == msg.sender || game.player2 == msg.sender);
        require(horizontal > 0 && vertical <4);
        require(vertical > 0 && vertical <4);
        require(msg.sender != game.lastShift);
        require(! FinishedGame(game));
        //store the game
        
        //check if there is a winner or if the grid is full
        
        games[idGame].lastShift = msg.sender;


    }
    function FinishedGame (Game memory game) private returns(bool){
        if (game.winner != address(0)) return true;
        for (uint i = 1; i < 4; i++){
            for (uint j = 1; j < 4; j++){
                if (game.plays[i][j] == 0) return false;
            }
            return true;
        }
    }
    modifier Implementer{
        require(msg.sender == address(this));
        _;
    }
}