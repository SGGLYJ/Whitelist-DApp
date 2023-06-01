// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

//프리세일 특정인 30명만 NFT 구매가능
//인원수 변수 필요
//승인된 사람들 지갑주소
//실제 등록한 지갑 수
//키벨류 형식 자료구조 사용해야 함 mapping(address => bool) public whitelistAddresses;

contract Whitelist {
    //최대 화리 수
    uint8 public maxWhitelistAddresses;

    //키밸류 자료구조, 화리 등록시 TRUE
    mapping(address => bool) public whitelistAddresses;


    uint public numAddressesWhitelisted;

    //Whitelist 컨트렉트가 실행될 때 함께 실행되는 생성자함수
    constructor(uint8 _maxWhitelistAddresses)
    {
        maxWhitelistAddresses = _maxWhitelistAddresses;
    }

    
    //지갑주소를 화리에 등록
    function  addAddressToWhitelist() public {
        require(!whitelistAddresses[msg.sender], "You are already on the Whitelist");

        //허용 가능치보다 더 많이 화리에 등록하려 함
        require(numAddressesWhitelisted < maxWhitelistAddresses, "Too many in whitelist");

        whitelistAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}