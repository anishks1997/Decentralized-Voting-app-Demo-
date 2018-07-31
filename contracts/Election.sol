pragma solidity ^0.4.24;


/**
 * The Election co publicntract does this and that...
 */
contract Election {

	// Model the candidate
	struct Candidate{

		uint id;
		string name;
		uint votecount;
	}

	// Store the candidates
	// Fetch the candidates
	mapping(uint => Candidate) public candidates;  // This is basically a getter function after we declare the variable publicly.
	// 'candidates' is a function that accesses the canidate using the key value
	// The function has to pass a key as an argument.

	// Keeping track of the voters' acitivities

	mapping(address => bool) public voters;

	// We keep a different getter this time.


	uint public candidate_counts;

	function addCandidate (string _name) private {

		candidate_counts++;  // candidate_counts is made to be the 'ID' of a particular candidate
		candidates[candidate_counts]=Candidate(candidate_counts, _name, 0);
		// This is how we set up the getter function parameter for inquiry
	// Is this an array instance of the original structure that is being fed by the constrcutor function

	}


	function vote (uint _candidateId) public {

		// Make sure a person cannot vote twice
		require(!voters[msg.sender]);
		// require that this address isn't in the mapping.

		// Only a valid candidate shuld be able to vote
		require(_candidateId > 0 && _candidateId <= candidate_counts);

		// We need to update the vote count 
		candidates[_candidateId].votecount++;

		//restrict multiple voting from the same account
		voters[msg.sender] = true;

	}

	// Is there a need for this constructor below ?

 	constructor () public {

 		// This is where we add the candidates

 		addCandidate("John Doe");
 		addCandidate("Lil John");
 		addCandidate("John Danvers");
 		addCandidate("John Reaper");
 		addCandidate("Johnny Walker");		
	}	
}

