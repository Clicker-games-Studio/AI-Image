import gradio as gr
import torch
from diffusers import StableDiffusionPipeline

model_id = "runwayml/stable-diffusion-v1-5"

# Detect if GPU is available
device = "cuda" if torch.cuda.is_available() else "cpu"
print(f"Using device: {device}")

# Load the model
pipe = StableDiffusionPipeline.from_pretrained(
    model_id,
    torch_dtype=torch.float32 if device == "cpu" else torch.float16
)
pipe = pipe.to(device)

def generate_image(prompt):
    # For GPU, use half precision for faster inference
    image = pipe(prompt, num_inference_steps=25).images[0]
    return image

demo = gr.Interface(
    fn=generate_image,
    inputs=gr.Textbox(label="Prompt"),
    outputs=gr.Image(label="Generated Image"),
    title="AI Image Generator",
    description="Write a prompt and generate an image using Stable Diffusion"
)

demo.launch()
