const { Product, Category, SubCategory, SubSubCategory } = require("../models");

module.exports = {
  async getAllProducts(req, res) {
    try {
      const products = await Product.findAll({
        order: [["createdAt", "DESC"]],
        attributes: [
          "id",
          "title",
          "amount",
          "currency",
          "rating",
          "sales",
          "image1",
          "CategoryId",
          "SubCategoryId",
          "SubSubCategoryId",
        ],
      });
      res.send(products);
      
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to fetch the products.",
      });
    }
  },
  async topSellProduct(req, res) {
    try {
      const limit = req.params.limit;
      const products = await Product.findAll({
        limit: parseInt(limit),
        order: [["id", "DESC"]],
        attributes: [
          "id",
          "title",
          "amount",
          "currency",
          "rating",
          "sales",
          "image1",
          "CategoryId",
          "SubCategoryId",
          "SubSubCategoryId",
        ],
      });
      res.send(products);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to fetch top sell products.",
      });
    }
  },
  async newAddProduct(req, res) {
    try {
      const limit = req.params.limit;
      const products = await Product.findAll({
        limit: parseInt(limit),
        order: [["createdAt", "DESC"]],
        attributes: [
          "id",
          "title",
          "amount",
          "currency",
          "rating",
          "sales",
          "image1",
          "CategoryId",
          "SubCategoryId",
          "SubSubCategoryId",
        ],
      });
      res.send(products);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to fetch recently added products.",
      });
    }
  },
  async getRecommendation(req, res) {
    try {
      const recommendation = await Product.findAll({
        where: {
          SubSubCategoryId: req.params.subSubCategoryId,
        },
        limit: parseInt(req.params.limit),
        order: [["createdAt", "DESC"]],
        attributes: [
          "id",
          "title",
          "amount",
          "currency",
          "rating",
          "sales",
          "image1",
          "CategoryId",
          "SubCategoryId",
          "SubSubCategoryId",
        ],
      });
      res.send(recommendation);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to fetch recommended products",
      });
    }
  },
  async getProductSales(req, res) {
    try {
      const product = await Product.findByPk(req.params.productId, {
        attributes: ["sales"],
      });
      res.send(product);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when tring to fetch a product sales",
      });
    }
  },
  async getProduct(req, res) {
    try {
      const product = await Product.findByPk(req.params.productId,{    attributes: [
        "id",
        "title",
        "amount",
        "currency",
        "rating",
        "sales",
        "image1",
        "CategoryId",
        "description",
        "subtitle",
        "SubCategoryId",
        "SubSubCategoryId",
      ],});
     
      res.send(product);
      console.log(product);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to fetch a product.",
      });
    }
  },

  async getProductId(req, res) {
    try {
      const product = await Product.findOne({
        where: {
          title: decodeURIComponent(req.params.productTitle),
        },
      });
      res.send(String(product.id));
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to fetch a product.",
      });
    }
  },
  async getProductById(req, res) {
    try {
      console.log(req.params.productTitle)
      const product = await Product.findOne({
        where: {
          title: req.params.productTitle,
          
        },
        attributes: ["id"]
      });
     console.log(product.id);
      res.send(product);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to fetch a product.",
        
      });
    }
  },
  async getProductRating(req, res) {
    try {
      const product = await Product.findByPk(req.params.productId, {
        attributes: ["rating", "peopleRated"],
      });
      res.send(product);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to fetch a product.",
      });
    }
  },
  async createProduct(req, res) {
    try {
      if (req.files != undefined) {
        req.body.image1 = "http://localhost:8084/" + req.files[0].path;
        if (req.files[1] != undefined) {
          req.body.image2 = "http://localhost:8084/" + req.files[1].path;
          if (req.files[2] != undefined) {
            req.body.image3 = "http://localhost:8084/" + req.files[2].path;
            if (req.files[3] != undefined) {
              req.body.image4 = "http://localhost:8084/" + req.files[3].path;
              if (req.files[4] != undefined) {
                req.body.image5 = "http://localhost:8084/" + req.files[4].path;
                if (req.files[5] != undefined) {
                  req.body.image6 =
                    "http://localhost:8084/" + req.files[5].path;
                  if (req.files[6] != undefined) {
                    req.body.image7 =
                      "http://localhost:8084/" + req.files[6].path;
                    if (req.files[7] != undefined) {
                      req.body.image8 =
                        "http://localhost:8084/" + req.files[7].path;
                      if (req.files[8] != undefined) {
                        req.body.image9 =
                          "http://localhost:8084/" + req.files[8].path;
                        if (req.files[9] != undefined) {
                          req.body.image10 =
                            "http://localhost:8084/" + req.files[9].path;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      const product = await Product.create(req.body);
    
      res.send({ id: product.id });
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to create a product.",
      });
    }
  },
  async QuantityProduct(req ,res){
    const { title, quantity } = req.body; 
    try{
      await Product.update({quantity},{
        where: { title },
      });
      res.send(req.body)
    } catch (err){
      res.status(500).send({
        error: "An error occured when trying to update quantity of product"
      })
    }
  },
  async SupdateProduct(req, res) {
    try {
      await Product.update(req.body, {
        where: {
          id: req.body.id,
        },
      
      });
      res.send(req.body);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to update a product.",
      });
    }
  },
  async AupdateProduct(req, res) {
    try {
      await Product.update(req.body, {
        where: {
          id: req.body.id,
        },
      
      });
      res.send(req.body);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to update a product.",
      });
    }
  },
  async deleteProduct(req, res) {
    try {
      const productId = req.params.productId;
      console.log(productId)
      const product = await Product.findByPk(productId);
      if (!product) {
        return res.status(403).send({
          error: "Aucun Produit pour supprimer.",
        });
      }
      await product.destroy();
      res.send(product);
    } catch (err) {
      res.status(500).send({
        error: "An error occured when trying to delete a product.",
      });
    }
  },
  async createHistoProduct(req, res) {
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
