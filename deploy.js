const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const { interface, bytecode } = require('./compile');

const provider = new HDWalletProvider(
    'torch slogan crew episode possible woman weird shift arrow unit farm helmet', 
    'https://rinkeby.infura.io/vieQa2ytuDozGJnwHyIZ'
);

const web3 = new Web3(provider);

const deplpy = async () => {
    const accounts = await web3.eth.getAccounts();
     
    console.log('Attempting to deploy from account', accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(interface))
        .deploy({
            data: bytecode, 
            arguments: ['Hi there!']
        })
        .send({
            from: accounts[0], 
            gas: '5000000'
        });

        result.setProvider(provider);
        console.log(interface);
    console.log('Contract deployed to', result.options.address);

};

deplpy();