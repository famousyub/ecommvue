<template>
    <div>
      <ATopHeader />
      <b-container class="mt-5">
        <b-row align-h="center">
          <b-col cols="7">
            <b-card style="color: #001e5f">
              <h4 class="font-weight-bold">Ajouter une Entreprise</h4>
                <b-form 
                @submit.stop.prevent="newCompany"
                 class="mt-4">
                  <b-row>
                  <b-col>
                    <b-form-group
                      id="input-group-first-name"
                      label="Nom d'Entreprise"
                      label-for="input-first-name"
                    >
                      <b-form-input
                        v-model="Name"
                        ref="firstNameField"
                        id="input-first-name"
                        type="text"
                        :state="NameValidation"
                        required
                      />
                      <b-form-invalid-feedback
                        v-if="Name"
                        :state="NameValidation"
                      >
                      Votre nom peut comporter 15 caractères.
                    </b-form-invalid-feedback>
                    </b-form-group>
                    </b-col>
                  
                    </b-row>
                    <b-col>
                    <b-form-group
                      id="input-group-phone-number"
                      label="Numero telephone"
                      label-for="input-phone-number"
                    >
                      <b-form-input
                        v-model="phoneNumber"
                        id="input-phone-number"
                        type="text"
                        :state="phoneNumberValidation"
                        required
                      />
                      <b-form-invalid-feedback
                        v-if="phoneNumber"
                        :state="phoneNumberValidation"
                      >
                          Votre numéro de téléphone doit comporter au moins 8 chiffres.
                      </b-form-invalid-feedback>
                    </b-form-group>
                    </b-col>
                    <b-form-group
                     id="input-group-email"
                        label="Email"
                     label-for="input-email"
                    >
                    <b-form-input
                    v-model="email"
                    id="input-email"
                    type="email"
                    @keyup="validEmail = true"
                    :state="validEmail && emailValidation"
                    required
                    />
                    <b-form-invalid-feedback
                    v-if="email"
                    :state="validEmail && emailValidation"
                  >
                    {{ emailMessage }}
                  </b-form-invalid-feedback>
                    </b-form-group>
  
                    <b-row>
                    <b-col>
                    <b-form-group
                      id="input-group-patente"
                      label="Patente"
                      label-for="input-patente"
                    >
                    <b-form-input
                        v-model="patente"
                        id="input-pattente"
                        type="text"
                        :state="PatenteValidation"
                        required
                      />
                    <b-form-invalid-feedback
                        v-if="patente"
                        :state="PatenteValidation"
                      >
                        Votre patente peut contenir entre 8 et 32 caractères.
                    </b-form-invalid-feedback>
                    </b-form-group>
                    </b-col>
                    
                    <b-col>
                    <b-form-group
                        id="input-group-images"
                        label="Logo d'entreprise"
                        label-for="input-images"
                    >
                    <b-form-file
                        id="input-images"
                        placeholder="Logo d'entreprise"
                        
                        @change="selectedImage"
                  />
                    </b-form-group>
                    <b-alert variant="warning" class="mt-2" :show="imageAlert">
                    {{ errorCountImage }}
                    </b-alert>
                    <div id="preview">
                    <b-row class="mt-2">
                    <b-col cols="3" v-for="(img, index) in dispImg" :key="index">
                      {{ index + 1 }}
                      <b-img :src="img" width="100%" />
                    </b-col>
                    </b-row>
                    </div>
                    </b-col>
                    </b-row>
                    
                    <b-row>
                    <b-col>
                    <b-form-group
                      id="input-group-location"
                      label="emplacement"
                      label-for="input-location"
                    >
                      <b-form-input
                        v-model="location"
                        ref="location"
                        id="input-location"
                        type="text"
                        :state="LocationValidation"
                       required
                      />
                      <b-form-invalid-feedback
                        v-if="location"
                        :state="LocationValidation"
                      >
                      Emplacement de votre entreprise introuvable.
                      </b-form-invalid-feedback>
                    
                    </b-form-group>

                    </b-col>
                    <b-col>
                    <b-form-group
                      id="input-group-header"
                      label="header"
                      label-for="input-header"
                    >
                        <b-form-input
                        v-model="header"
                        ref="header"
                        id="input-header"
                        type="text"
                        :state="headerValidation"
                       required
                        />
                        <b-form-invalid-feedback
                        v-if="header"
                        :state="headerValidation"
                    >
                    L'en-tête de votre entreprise doit comporter au moins 32 caractères.
                        </b-form-invalid-feedback>
                    
                    </b-form-group>
                    
                    </b-col>
                    </b-row>
                    <b-row class="mt-3">
                    <b-col cols="3" />
                    <b-col cols="6">
                    <b-button @click="addedCompany()" block type="submit" class="p-2" variant="warning">
                     Ajouter une entreprise
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
   import CompanyService from "@/services/CompanyService";
  export default {
    name: "AddSupplier",
    components: {
      ATopHeader,
      MyFooter,
    },
    data() {
      return {
        errorCountImage:
          "Vous n'êtes pas autorisé à ajouter plus d'une image pour cette entreprise.",
        maximumImageCount: 1,
        imageAlert: false,
        dispImg: [],
        emailMessage: null,
        Name: null,
        patente: null,
        email: null,
        formatName: /^^[a-zA-Z]{1,15}$/,
        formatEmail: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/,
        image: null,
        location : null,
        formatLocation: /^[a-zA-Z0-9._,-]{1,25}$/,
        formatHeader: /^.{1,32}$/,
        validEmail: true,
        header: null,
        priority:2,
        formatPatente: /^[0-9]{8,32}$/,   
        phoneNumber: null,
        formatPhoneNumber: /^[0-9]{8,32}$/,
      };
    },
    mounted() {
      this.$refs.firstNameField.focus();
    },
    computed: {
      tokenAlert() {
        if (this.message == null) return null;
        else if (this.message.length == 0) return false;
        else return true;
      },
      NameValidation() {
        if (this.Name == null) return null;
        else if (!this.formatName.test(this.Name)) return false;
        else return true;
      },
      PatenteValidation() {
        if (this.patente == null) return null;
        else if (!this.formatPatente.test(this.patente)) return false;
        else return true;
      },
      emailValidation() {
        if (this.email == null) return null;
        else if (!this.formatEmail.test(this.email)) return false;
        else return true;
      },
      headerValidation() {
        if (this.header == null) return null;
        else if (!this.formatHeader.test(this.header)) return false;
        else return true;
      },
      LocationValidation() {
        if (this.location == null) return null;
        else if (
          !this.formatLocation.test(this.location))return false;
        else return true;
      },
      phoneNumberValidation() {
        if (this.phoneNumber == null) return null;
        else if (
          !this.formatPhoneNumber.test(this.phoneNumber)
        )
          return false;
        else return true;
      },
    
    },
    methods: {
       
        selectedImage(event) {
        this.image = event.target.files;
  
        if (this.image.length > this.maximumImageCount) {
          this.imageAlert = true;
        } else {
          this.imageAlert = false;
        }
        var i;
  
        this.dispImg = [];
        for (i = 0; i < this.images.length; i++) {
          if (i < this.maximumImageCount) {
            this.dispImg[i] = URL.createObjectURL(this.images[i]);
          }
        }
      },
      async newCompany() {
        if (
          !this.NameValidation ||
          !this.PatenteValidation ||
          !this.LocationValidation ||
          !this.headerValidation ||
          !this.phoneNumberValidation
           
        )
          return;
        try {
          const company = await CompanyService.createCompany({
            name: this.Name,
            email: this.email,
            phoneNo:this.phoneNumber,
            header:this.header,
           
            logo: this.image,
            location: this.location,
           
            patente:this.patente,
  
          });
        
          console.log(company);
          
          
        } catch (error) {
          this.validEmail = false;
          this.emailMessage = error.response.data.error;
        }
      },
      async addedCompany(){ 
      this.$bvToast.toast("The company has been added successfully", {
            title: "ADD",
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
  