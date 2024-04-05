module.exports = (sequelize, DataTypes) => {
    const Product = sequelize.define('Product', {
      id: {
        type:           DataTypes.INTEGER,
        allowNull:      false,
        primaryKey:     true,
        autoIncrement:  true
      },
      code:             DataTypes.STRING,
      title:            DataTypes.STRING,
      subtitle:         DataTypes.STRING,
      description:      DataTypes.TEXT,
      amount:           DataTypes.FLOAT,
      sales:         DataTypes.INTEGER,
      
      rating:           DataTypes.FLOAT,
      peopleRated:      DataTypes.INTEGER,
      currency:           DataTypes.STRING,
      
      image1:           DataTypes.STRING,
      image2:           DataTypes.STRING,
      image3:           DataTypes.STRING,
     
     
    })
    Product.associate = function (models) {
      Product.belongsTo(models.Category)
      Product.belongsTo(models.SubCategory)
      Product.belongsTo(models.SubSubCategory)
      Product.belongsTo(models.Company)
    }
    return Product
  }