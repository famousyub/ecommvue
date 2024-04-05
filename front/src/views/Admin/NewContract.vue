<template>
    <div>
      <ATopHeader />
      <b-container class="mt-5">
        <b-row align-h="center">
          <b-col cols="7">
            <b-card style="color: #001e5f">
              <h4 class="font-weight-bold">Nouveau contrat</h4>
              <b-form @submit.stop.prevent="newContract" class="mt-4">
                <b-row>
                  <b-col>
                    <b-form-group  id="input-start"
                      label="Nom d'Entreprise"
                      label-for="input-name"
                      >
                      <b-form-input
                        v-model="companyName"
                        id="input-name"
                        type="text"
                        :state="NameValidation"
                        required
                      />
                      <b-form-invalid-feedback
                        v-if="companyName"
                        :state="NameValidation"
                      >
                      Votre nom peut comporter 15 caractères.
                      </b-form-invalid-feedback>
                    </b-form-group>
                  </b-col>
                </b-row>
                  <b-row>
                  <b-col>
                    <b-form-group
                      id="input-start"
                      label="Date Début"
                      label-for="input-start"
                    >
                      <b-form-input
                        v-model="startDate"
                        id="input-last-name"
                        type="date"
                      
                        required
                      />
                      
                    </b-form-group>
                  </b-col>
                
                </b-row>
                <b-col>
                    <b-form-group
                      id="input-end"
                      label="Date Fin"
                      label-for="input-end"
                    >
                      <b-form-input
                        v-model="endDate"
                        id="input-end"
                        type="date"
                        
                        required
                      />
                      
                    </b-form-group>
                  </b-col>
                  <b-row>
                  <b-col>
                <b-form-group
                  id="input-commission"
                  label="Commission"
                  label-for="input-Comission"
                >
                  <b-form-input
                    v-model="commission"
                    id="input-commission"
                    type="text"
                    
                    required
                  />
                  <b-form-invalid-feedback
                    v-if="commission"
                    :state="CommissionValidation"
                  >
                  veuillez entrer un nombre inférieur à 1
                  </b-form-invalid-feedback>
                </b-form-group>
                </b-col>
                <b-form-group
                  id="input-group-title"
                  label="Titre du produit"
                  label-for="input-title"
                >
                  <b-form-input
                    id="input-title"
                    v-model="productTitle"
                    placeholder="Entrez le nom du produit"
                    required
                  />
                </b-form-group>
                </b-row>
                    
  
               
                <b-row class="mt-3">
                  <b-col cols="3" />
                  <b-col cols="6">
                    <b-button  @click="addedContract()" block type="submit" class="p-2" variant="warning">
                      Nouveau contrat

                    </b-button>
                  </b-col>
                  <b-col cols="3" />
                </b-row>
              </b-form>
              <hr />
              
            </b-card>
          </b-col>
        </b-row>
      </b-container>
      <MyFooter class="mt-5" />
    </div>
  </template>
  
  <script>
  import ATopHeader from "@/components/Admins/ATopHeader.vue";
  import MyFooter from "@/components/Common/MyFooter.vue";
  import CompanyService from "@/services/CompanyService.js";
import ProductsService from '../../services/ProductsService';
  export default {
    name: "NewContract",
    components: {
      ATopHeader,
      MyFooter,
    },
    data() {
      return {
        startDate: null,
        endDate: null,
        formatName: /^^[a-zA-Z]{1,15}$/,
        commission: null,
        companyName:  null,
        
        
        productTitle: null,
      };
    },
    mounted() {
      
    },
    computed: {
      tokenAlert() {
        if (this.message == null) return null;
        else if (this.message.length == 0) return false;
        else return true;
      },
    
      CommissionValidation() {
        if (this.commissionF == null) return null;
        else if (!this.commissionF< 1 ) return false;
        else return true;
      },
      NameValidation() {
        if (this.Name == null) return null;
        else if (!this.formatName.test(this.Name)) return false;
        
        else return true;
      },
    },
    methods: {
        set_company(company) {
        this.companyName = company.name;
        this.CompanyLogo = company.id;
      },

      async newContract() {
        if (
          
          !this.CommissionValidation       
        )
          return;
        try {
          console.log(this.productTitle);
          const productId = (await ProductsService.getProductById(this.productTitle)).data;
          console.log(productId);
            const companyId = (await CompanyService.getCompanyByName(this.companyName)).data;
          const contract = await CompanyService.createContract({
            startDate: this.startDate,
            endDate: this.endDate,
            commission: parseFloat(this.commission),
          
            CompanyId: companyId,
            ProductId: productId,
  
          }).data;
          console.log(contract);
        } catch (error) {
            console.error(error);
        }
      },
      async addedContract(){ 
      this.$bvToast.toast("Le contrat a été ajouté avec succès", {
            title: "Ajouter",
            variant: "success",
            toaster: "b-toaster-top-center",
            noCloseButton: false,
            solid: true,
          });
        },
    },
  };
  </script>
  
  <style scoped lang="scss"></style>
  