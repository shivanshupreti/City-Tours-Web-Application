<template>
    <div class="small-card">
      <img v-if="landmark.imageUrl" :src="landmark.imageUrl" alt="Landmark Image" class="landmark-image"/>
      <div class="landmark-info">
        <h2 class="landmark-name">{{ landmark.name }}</h2>
        <button :style="buttonStyle" @click="toggleAdded">{{ isAdded ? 'Added' : 'Not Added' }}</button>
      </div>
    </div>
</template>
  
<script>
export default {
  props: {
    landmark: {
      type: Object,
      required: true
    }
  },
  data() {
    return {
      isAdded: false
    };
  },
  computed: {
    buttonStyle() {
      return {
        backgroundColor: this.isAdded ? '#4CAF50' : '#f66d6b',
        color: 'white'
      };
    }
  },
  methods: {
    toggleAdded() {
      this.isAdded = !this.isAdded;
      this.$emit('update-landmark-status', { landmark: this.landmark, isAdded: this.isAdded });
    }
  }
};
</script>
  
<style scoped>
.small-card {
    border: 1px solid wheat;
    border-radius: 10px;
    width: 100%;
    max-width: 260px;
    height: auto;
    max-height: 100px;
    margin: 5px;
    padding: 10px;
    display: flex;
    align-items: flex-start;
    background-color: blanchedalmond;
}

.landmark-image {
    width: 50%;
    height: 100px;
    object-fit: cover;
    border-right: 1px solid wheat; 
    margin-right: 10px;
    border-radius: 5px;
}

.landmark-info {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.landmark-name {
    font-size: .90rem;
    margin: 0;
    font-family: 'Courier New', Courier, monospace;
    text-align: left;
    padding-bottom: 30px;
}

button {
    border: none;
    cursor: pointer;
    padding: 5px 10px;
    font-size: 0.75rem;
    width: auto;
    transition: background-color 0.3s;
    border-radius: 5px;
}

button:hover {
    background-color: #45a049;
}
</style>
