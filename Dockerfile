# Use official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies required for Playwright
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . .

# Install dependencies and the package
RUN pip install --no-cache-dir .

# Install Playwright browsers and dependencies
RUN playwright install --with-deps chromium

# Set entrypoint
ENTRYPOINT ["http2md"]
CMD ["--help"]
