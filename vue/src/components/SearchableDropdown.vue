<template>
    <div class="dropdown">
      <select v-model="selectedOption" @change="handleOptionChange">
        <option disabled value="">Select Search Criteria</option>
        <option value="city">City</option>
        <option value="venueType">Venue Type</option>
        <option value="dayOfWeek">Day of Week</option>
      </select>
      <input
        v-if="selectedOption"
        v-model="searchInput"
        :placeholder="`Enter ${placeholderText}`"
        @input="emitSearchCriteria"
        @keyup.enter="emitSearch"
      />
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        selectedOption: '',
        searchInput: '',
        placeholderText: ''
      };
    },
    methods: {
      handleOptionChange() {
        this.placeholderText = this.getPlaceholderText();
        this.searchInput = ''; 
        this.emitSearchCriteria();
      },
      emitSearchCriteria() {
        if (this.searchInput.trim() !== '') {
          this.$emit('update:modelValue', `${this.selectedOption}: ${this.searchInput.trim()}`);
        } else {
          this.$emit('update:modelValue', ''); 
        }
      },
      emitSearch() {
        this.$emit('search'); 
      },
      getPlaceholderText() {
        switch (this.selectedOption) {
          case 'city':
            return 'city name';
          case 'venueType':
            return 'venue type';
          case 'dayOfWeek':
            return 'day of the week';
          default:
            return '';
        }
      }
    },
    watch: {
      selectedOption(newVal) {
        if (!newVal) {
          this.searchInput = ''; 
        }
      }
    }
  };
  </script>
  
  <style scoped>
  .dropdown {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }
  
  select, input {
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  
  input {
    display: block; 
  }
  </style>