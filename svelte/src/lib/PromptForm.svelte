<script lang="ts">
  export let onSave: (prompt: { scene: string; subject: string; setting: string; style: string }) => void;

  let prompt = {
    scene: '',
    subject: '',
    setting: '',
    style: ''
  };

  function handleSave() {
    if (prompt.scene.trim() || prompt.subject.trim() || prompt.setting.trim() || prompt.style.trim()) {
      onSave({ ...prompt });
      prompt = { scene: '', subject: '', setting: '', style: '' };
    }
  }
</script>

<div class="prompt-form">
  <div class="form-row">
    <label>
      <span>Scene:</span>
      <input type="text" bind:value={prompt.scene} placeholder="Enter the scene...">
    </label>
  </div>
  <div class="form-row">
    <label>
      <span>Subject:</span>
      <input type="text" bind:value={prompt.subject} placeholder="Enter the subject...">
    </label>
  </div>
  <div class="form-row">
    <label>
      <span>Setting:</span>
      <input type="text" bind:value={prompt.setting} placeholder="Enter the setting...">
    </label>
  </div>
  <div class="form-row">
    <label>
      <span>Style:</span>
      <input type="text" bind:value={prompt.style} placeholder="Enter the style...">
    </label>
  </div>
  <button on:click={handleSave}>Save Prompt</button>
</div>

<style>
  .prompt-form {
    display: flex;
    flex-direction: column;
    gap: 30px;
    margin-bottom: 40px;
    background-color: #2c2c2c;
    padding: 40px;
    border-radius: 12px;
  }

  .form-row {
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 90%; /* Set the width of the form row to 90% */
    margin: 0 auto; /* Center the form row */
  }

  label {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  label span {
    font-size: 18px;
    font-weight: bold;
  }

  input {
    width: 100%; /* Keep the input width at 100% of its parent (.form-row) */
    padding: 15px;
    font-size: 16px;
    background-color: #3c3c3c;
    border: 2px solid #555;
    color: #e0e0e0;
    border-radius: 8px;
  }

  input::placeholder {
    color: #888;
  }

  button {
    padding: 15px 30px;
    font-size: 18px;
    background-color: #bb86fc;
    color: #1e1e1e;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
    align-self: center; /* Center the button */
    margin-top: 10px;
  }

  button:hover {
    background-color: #a174e0;
  }

  @media (max-width: 600px) {
    .prompt-form {
      padding: 30px;
      gap: 25px;
    }

    .form-row {
      width: 100%; /* Full width on mobile */
    }

    input {
      padding: 12px;
    }

    button {
      width: 100%; /* Full width button on mobile */
    }
  }
</style>