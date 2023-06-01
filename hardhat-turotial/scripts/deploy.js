//구조분해할당 문법, hardhat 내부에 있는 ethers뽑아오고 그걸 변수 ethers에 할당
const { ethers } = require("hardhat");

// 스마트컨트랙트를 블록체인상에 배포할 때 실행될 메인 함수
async function main()
{
  //ethers에서 제공해주는 스마트컨트랙트 배포할 때 쓰는 함수인 getContractFactory를 사용해서
  //스마트컨트랙트를 메모리상에 올림(인스턴스화)
  const whiteListContract = await ethers.getContractFactory("Whitelist");
  
  //실제 배포 함수 실행. 생성자 함수에 넘겨줄 값도 같이 입력
  const deployedWhitelistContract = await whiteListContract.deploy(10);

  //스컨이 배포될때까지 대기
  await deployedWhitelistContract.deployed();

  //배포가 완료되면 로그창에 스컨 주소 출력
  console.log("whitelist contract address: ", deployedWhitelistContract.address)
}

main() //메인 함수 실행
.then(()=> process.exit(0)) //이 함수 정상적으로 실행되면 프로세스 종료(정상코드인 0)
.catch((err)=>//에러 났을 때 처리
{
  console.error((err));
  process.exit(1);//비정상 종료코드 1
})