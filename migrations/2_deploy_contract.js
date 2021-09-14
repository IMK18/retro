// SPDX-License-Identifier: MIT
// migrations/2_deploy_contract.js


const  Retrography = artifacts.require("./Retrography");

module.exports = function (deployer) {
  deployer.deploy(Retrography);
};

const Address = artifacts.require("./Address");

module.exports = function (deployer) {
  deployer.deploy(Address);
};

const Context = artifacts.require("./Context");

module.exports = function (deployer) {
  deployer.deploy(Context);
};

const ERC165 = artifacts.require("./ERC165");

module.exports = function (deployer) {
  deployer.deploy(ERC165);
};

const ERC721 = artifacts.require("./ERC721");

module.exports = function (deployer) {
  deployer.deploy(ERC721);
};

const ERC721Enumerable = artifacts.require("./ERC721Enumerable");

module.exports = function (deployer) {
  deployer.deploy(ERC721Enumerable);
};

const IERC165 = artifacts.require("./IERC165");

module.exports = function (deployer) {
  deployer.deploy(IERC165);
};

const IERC721 = artifacts.require("./IERC721");

module.exports = function (deployer) {
  deployer.deploy(IERC721);
};

const IERC721Enumerable = artifacts.require("./IERC721Enumerable");

module.exports = function (deployer) {
  deployer.deploy(IERC721Enumerable);
};

const IERC721Metadata = artifacts.require("./IERC721Metadata");

module.exports = function (deployer) {
  deployer.deploy(IERC721Metadata);
};

const IERC721Receiver = artifacts.require("./IERC721Receiver");

module.exports = function (deployer) {
  deployer.deploy(IERC721Receiver);
};

const Ownable = artifacts.require("./Ownable");

module.exports = function (deployer) {
  deployer.deploy(Ownable);
};

const Strings = artifacts.require("./Strings");

module.exports = function (deployer) {
  deployer.deploy(Strings);
}; 