<template>

  <main>
  <div class="header-2"> 
    
    
    
     <nav   class="bg-white py-2 md:py-4">
    <b-navbar toggleable="lg" type="dark" variant="dark" style="background-color: #3b5998;"  
    >
    <div class="flex justify-between items-center"   style="background-color:  #3b5998;">
        <a href="#" class="font-bold text-xl text-indigo-600">

          <b-navbar-brand href="/">
          <b-img src="http://localhost:8084/public/EShopping/logo.png" alt="logo" width="70px" height="60px" />
        </b-navbar-brand>
        </a>
       
      </div>

    <div class="container px-4 mx-auto md:flex md:items-center" style="background-color:  #3b5998;">

      <b-container>


       
        <b-navbar-toggle target="nav-top-header-collapse" />
        <b-collapse id="nav-top-header-collapse" is-nav>
          <b-navbar-nav class="mr-auto" v-if="userLoggedIn">
            <b-nav-item-dropdown right>
              <template #button-content   >
              <i class="fas fa-bars"></i>
              </template>
              <b-dropdown-item v-for="category in categoryList" :key="category.id" @click="set_category(category)" >
                {{ category.name }}
              </b-dropdown-item>
            </b-nav-item-dropdown>
            <b-nav-form v-on:submit.prevent="search" class="ml-auto mr-2">
              <span>
              <b-form-input v-model="searchTxt" placeholder="Chercher par catégories" />
              <b-button type="submit" variant="outline-light">
                <b-icon-search></b-icon-search>
              </b-button>
            </span>
            </b-nav-form>
          </b-navbar-nav>
          <b-navbar-nav class="ml-auto">
            <b-nav-item @click="wishlist"  v-if="userLoggedIn">
              <b-icon-suit-heart-fill></b-icon-suit-heart-fill>
              Liste de souhaits
            </b-nav-item>
            <b-nav-item @click="cart"  v-if="userLoggedIn">
              <b-icon-cart2></b-icon-cart2>
              Chariot
            </b-nav-item>
            <b-nav-item-dropdown right v-if="userLoggedIn">
              <template #button-content>
                <b-img :src="user.profileImage" alt="Profile Image" height="35px" width="35px" />
              </template>
              <b-dropdown-item v-if="user.priority==1" to="/admin">Panneau d'Administration</b-dropdown-item>
              <b-dropdown-item v-if="user.priority==2" to="/supplier">Panneau Fournisseur</b-dropdown-item>
              <b-dropdown-item to="/profile">Profile</b-dropdown-item>
              <b-dropdown-item @click="logout">Log Out</b-dropdown-item>
            </b-nav-item-dropdown>
            <b-button v-if="!userLoggedIn" to="/login" variant="outline-light" class="ml-auto">S'inscrire &amp; Connexion</b-button>
          </b-navbar-nav>
        </b-collapse>
      </b-container>

    </div>
    </b-navbar>
  </nav>

    <hr class="my-0" style="background-color: #000" />


  </div>
</main>
</template>
  <script>
  import './TopHeader.css';
  export default {
    name: "TopHeader",
    data() {
      return {
        user: {},
        admin: false,
        companyLogo: "",
        userLoggedIn: false,
        categoryList: [],
        searchTxt: "",
        searchCategoryId: 0,
        searchCategoryName: "Toutes les catégories",

      };
    },
    async mounted() {
      this.companyLogo = await this.$store.dispatch("http://localhost:8084/public/company/EShopping/eshopping.png"); 
      this.user = this.$store.state.CurrentUser.user;
  
      this.admin = this.$store.state.CurrentUser.admin;
      this.userLoggedIn = this.$store.state.CurrentUser.userLoggedIn;
      this.categoryList = await this.$store.dispatch("Category/getCategoryList");
    },
    computed: {},
    methods: {
      wishlist() {
        if (!this.userLoggedIn) {
          this.$bvToast.toast("Veuillez vous connecter pour la Liste de souhaits", {
            title: "Liste de souhaits",
            variant: "primary",
            toaster: "b-toaster-top-center",
            noCloseButton: false,
            solid: true,
          });
        } else {
          this.$router.push({ path: "/wishlist" });
        }
      },
      cart() {
        if (!this.userLoggedIn) {
          this.$bvToast.toast("Veuillez vous connecter pour le chariot", {
            title: "Chariot",
            variant: "primary",
            toaster: "b-toaster-top-center",
            noCloseButton: false,
            solid: true,
          });
        } else {
          this.$router.push({ path: "/cart-view" });
        }
      },
      async logout() {
        this.$store.dispatch("CurrentUser/setToken", "");
        this.$store.dispatch("CurrentUser/setUser", {});
        this.$store.dispatch("Wishlist/clearWishlist");
        
        this.$store.dispatch("Cart/clearCart"  );
        window.location.reload();
      },
      set_category(category) {
        this.searchCategoryId = category.id;
        this.searchCategoryName = category.name;
      },
      search() {
        var newRoute = "/products";
        if (this.searchCategoryId != 0) {
          const category = this.searchCategoryName;
          newRoute += "/" + category;
        }
        if (this.searchTxt.trim() != "") {
          const text = this.searchTxt.trim();
          newRoute += "?q=" + text;
          this.$router.push({ path: newRoute });
        }
      },
    },
  };
  </script>
  
  <style scoped>
.navbar {
  background-color: #3b5998;
}
</style>
  