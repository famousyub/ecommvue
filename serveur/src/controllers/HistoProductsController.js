const { HistoProduct, Company } = require("../models");
module.exports = {
async createHistoproduct(req, res) {
    try {
  
      const histoProduct = await HistoProduct.create({
       
       amount: req.body.amount,
       CompanyId: req.body.CompanyId,
       updatedAt: req.body.updatedAt,
    });
      res.send({ id: histoProduct.id });
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to create a product.",
      });
    }
  },
  
};
