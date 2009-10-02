using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Kona.Model
{

    public enum TransactionProcessor
    {
        FakePaymentProcessor=1,
        PayPal=2
    }
    
    
    public class Transaction
    {
        public Guid ID { get; set; }
        public decimal Amount { get; set; }
        public DateTime DateExecuted { get; set; }
        public string AuthorizationCode { get; set; }
        public string Notes { get; set; }

        public TransactionProcessor Processor { get; set; }

        public bool IsRefund
        {
            get
            {
                return Amount <= 0;
            }
        }
        private Transaction() { }

        public static Transaction Create(decimal amount, string authCode, TransactionProcessor processor) {
           return  Create(amount, DateTime.Now, authCode, "", processor);
        }

        public static Transaction Create(decimal amount, DateTime executed, string authCode, string notes, TransactionProcessor processor)
        {

            var trans = new Transaction();
            trans.ID = Guid.NewGuid();
            trans.Amount = amount;
            trans.DateExecuted = executed;
            trans.AuthorizationCode = authCode;
            trans.Notes = notes;
            trans.Processor = processor;

            return trans;
        }

    }
}
