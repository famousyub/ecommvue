export const CheckoutModule = {
    namespaced: true,
    strict: true,
    state: {
      customerDetails: {
        name: "",
        email: "",
        phoneNo: "",
        address: {
          line1: "",
          
          PostalCode: "",
          city: "",
         
          country: "",
        },
      },
      shippingRate: 4,
    },
    mutations: {
      SET_CUSTOMER_NAME(state, name) {
        state.customerDetails.name = name;
      },
      SET_CUSTOMER_EMAIL(state, email) {
        state.customerDetails.email = email;
      },
      SET_CUSTOMER_PHONE_NO(state, phoneNo) {
        state.customerDetails.phoneNo = phoneNo;
      },
      SET_CUSTOMER_ADDRESS_LINE1(state, line1) {
        state.customerDetails.address.line1 = line1;
      },
     
      SET_CUSTOMER_ADDRESS_POSTAL_CODE(state, PostalCode) {
        state.customerDetails.address.PostalCode = PostalCode;
      },
      SET_CUSTOMER_ADDRESS_CITY(state, city) {
        state.customerDetails.address.city = city;
      },
    
      SET_CUSTOMER_ADDRESS_COUNTRY(state, country) {
        state.customerDetails.address.country = country;
      },
    },
    actions: {
      resetCustomerDetails({ commit }) {
        commit("SET_CUSTOMER_NAME", "");
        commit("SET_CUSTOMER_EMAIL", "");
        commit("SET_CUSTOMER_PHONE_NO", "");
        commit("SET_CUSTOMER_ADDRESS_LINE1", "");
       
        commit("SET_CUSTOMER_ADDRESS_POSTAL_CODE", "");
        commit("SET_CUSTOMER_ADDRESS_CITY", "");
      
        commit("SET_CUSTOMER_ADDRESS_COUNTRY", "");
      },
      informationValidate({ state }) {
        const emailFormat = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        const phoneNoFormat = /^[0-9+-]{6,20}$/;
        if (
          state.customerDetails.name == "" ||
          !phoneNoFormat.test(state.customerDetails.phoneNo) ||
          !emailFormat.test(state.customerDetails.email) ||
          state.customerDetails.address.line1 == "" ||
          
          state.customerDetails.address.postalCode == "" ||
          state.customerDetails.address.city == "" ||
          state.customerDetails.address.division == "" ||
          state.customerDetails.address.country == ""
        )
          return false;
        else {
          var i,
            shippingAddress = "";
          for (i in state.customerDetails.address) {
            if (i == "PostalCode") {
              shippingAddress +=
                "<b>Postal code:</b> " + state.customerDetails.address[i] + "<br/>";
              continue;
            }
            shippingAddress +=
              "<b>" + i + ":</b> " + state.customerDetails.address[i] + "<br/>";
          }
          const data = {
            name: state.customerDetails.name,
            email: state.customerDetails.email,
            phoneNo: state.customerDetails.phoneNo,
            shippingAddress: shippingAddress,
          };
          return data;
        }
      },
      setCustomerName({ commit }, name) {
        commit("SET_CUSTOMER_NAME", name);
      },
      setCustomerEmail({ commit }, email) {
        commit("SET_CUSTOMER_EMAIL", email);
      },
      setCustomerPhoneNo({ commit }, phoneNo) {
        commit("SET_CUSTOMER_PHONE_NO", phoneNo);
      },
      setCustomerAddressLine1({ commit }, line1) {
        commit("SET_CUSTOMER_ADDRESS_LINE1", line1);
      },
   
      setCustomerAddressPostalCode({ commit }, PostalCode) {
        commit("SET_CUSTOMER_ADDRESS_POSTAL_CODE", PostalCode);
      },
      setCustomerAddressCity({ commit }, city) {
        commit("SET_CUSTOMER_ADDRESS_CITY", city);
      },
   
      setCustomerAddressCountry({ commit }, country) {
        commit("SET_CUSTOMER_ADDRESS_COUNTRY", country);
      },
    },
  };
  