'use strict';

/**
 * Funds transfer transaction
 * @param {org.example.mynetwork.FundsTransfer} data
 * @transaction
 */
async function transfer(data) {

    //Sender balance checking
    if (data.sender.balance < data.amount) {
        throw new Error('Insuficient funds.');
    }

    //Updating sender and recipient balance
    data.sender.balance -= data.amount;
    data.recipient.balance += data.amount;

    //Updating bank accounts (sender and recipient)
    const accountRegistry = await getAssetRegistry('org.example.mynetwork.Account');
    await accountRegistry.update(data.sender);
    await accountRegistry.update(data.recipient);

}