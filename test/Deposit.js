const { expect } = require('chai');
const { ethers } = require('hardhat');

const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether')
}

describe('Deposit', ()=>{

  let sender, token, deposit  
  let cost = 1000000000000000000n; 
  let transferAmount = 100000000000000000000n; 

  beforeEach(async()=>{

        const Deposit = await ethers.getContractFactory('Deposit')
        const Token = await ethers.getContractFactory('Token')

        token = await Token.deploy('Axalot', 'AXA', '1000000000000000000000000000000000000')
        deposit = await Deposit.deploy()

        accounts = await ethers.getSigners()
        deployer = accounts[0]
        sender = accounts[1]

        let transaction = await token.connect(deployer).transfer(deposit.address, tokens(100))
        await transaction.wait()

  })

  describe('Deployment', () => {
    it('tracks the cost', async () => {
      expect(await deposit.cost()).to.equal(cost)
    })
    it('tracks the transferAmount', async () => {
      expect(await deposit.transferAmount()).to.equal(transferAmount)
    })
  })

  describe('Depositing Eth',()=>{
    let transaction, result

    describe('Success',()=>{
      beforeEach(async()=>{
          transaction = await deposit.connect(deployer).depositETH(token.address, sender.address, {value: ethers.utils.parseUnits("1", "ether")})
          result = await transaction.wait()
      })
      it('deposits eth',async()=>{        
        expect(await token.balanceOf(sender.address)).to.equal(transferAmount)
      })
    })
  })
})
