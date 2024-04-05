
module.exports = {
  async createCheckoutSession(req, res) {
    try {
      const checkoutProduct = req.body.checkoutProduct;
      
      var i;
      var item1 = [];
      console.log(checkoutProduct);
      for (i = 0; i < checkoutProduct.length; i++) {

        item1.push(checkoutProduct[i]);   
      }

      const session = await stripe.checkout.sessions.create({
        success_url:
          "http://localhost:8080/successful?id={1}",
        line_items: item1,
        metadata: {
          customerName: req.body.customerName,
          customerPhoneNo: req.body.customerPhoneNo,
          shippingAddress: req.body.shippingAddress,
        },
        customer_email: req.body.customerEmail,
      });
      res.json({
        id: session.id,
      });
 
      
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to checkout ",
      });
    }
  },
  async retrieveCheckoutSession(req, res) {
    try {
      const sessionId = req.params.sessionId;
      
      res.send(sessionId);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to retrieve checkout session.",
      });
    }
  },
};
