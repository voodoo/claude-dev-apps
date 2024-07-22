<script lang="ts">
  export let onSave: (prompt: { scene: string; subject: string; setting: string; style: string }) => void;

  let prompt = {
    scene: '',
    subject: '',
    setting: '',
    style: ''
  };

  function handleSave() {
    if (prompt.scene.trim() && prompt.subject.trim()) {
      onSave({ ...prompt });
      prompt = { scene: '', subject: '', setting: '', style: '' };
    } else {
      alert('Scene and Subject are required!');
    }
  }
</script>

<h1>Midjourney Prompt Creator</h1>
<div class="prompt-form">
  <div class="form-row">
    <label>
      <span>Scene: *</span>
      <input type="text" bind:value={prompt.scene} placeholder="Enter the scene (required)...">
    </label>
  </div>
  <div class="form-row">
    <label>
      <span>Subject: *</span>
      <input type="text" bind:value={prompt.subject} placeholder="Enter the subject (required)...">
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
  h1 {
    color: #ffffff;
    font-size: 28px;
    margin: 0 0 20px 0;
    text-align: left;
  }

  .prompt-form {
    display: flex;
    flex-direction: column;
    gap: 30px;
    margin-bottom: 40px;
    background-color: #1a1a1a;
    padding: 40px;
    border-radius: 12px;
  }

  .form-row {
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 90%;
    margin: 0 auto;
  }

  label {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  label span {
    font-size: 18px;
    font-weight: bold;
    color: #c0c0c0;
  }

  input {
    width: 100%;
    padding: 15px;
    font-size: 16px;
    background-color: #2a2a2a;
    border: 2px solid #3a3a3a;
    color: #e0e0e0;
    border-radius: 8px;
  }

  input::placeholder {
    color: #808080;
  }

  button {
    padding: 15px 30px;
    font-size: 18px;
    background-color: #3a3a3a;
    color: #e0e0e0;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
    align-self: center;
    margin-top: 10px;
  }

  button:hover {
    background-color: #4a4a4a;
  }

  @media (max-width: 600px) {
    .prompt-form {
      padding: 30px;
      gap: 25px;
    }

    .form-row {
      width: 100%;
    }

    input {
      padding: 12px;
    }

    button {
      width: 100%;
    }
  }
</style>