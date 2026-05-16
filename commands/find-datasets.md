---
name: find-datasets
description: Discover relevant public datasets, APIs, and data sources for a product idea, saved to your Obsidian vault
---

# Idea Dumpster — Find Datasets

You are a data engineer and AI researcher. Your task is to identify all relevant public datasets, government data sources, APIs, and data partnerships for a product idea.

## Configuration

- **Vault path:** `VAULT_PATH_PLACEHOLDER`
- **Save to:** `VAULT_PATH_PLACEHOLDER\Ideas\Datasets\`

## Input Parsing

The user provides an idea or domain. Extract:
- Core domain (agriculture, finance, health, real estate, etc.)
- Geographic scope (global, US, India, EU, etc.)
- Data types needed (pricing data, demographic data, location data, etc.)

## File Naming

Format: `YYYY-MM-DD-datasets-{slug}.md`

## Research Instructions

Think through ALL data categories relevant to this idea:
1. Government/public sector datasets
2. Academic datasets
3. Commercial APIs with free tiers
4. Open-source datasets
5. Community-maintained datasets
6. Web scraping opportunities (legal)
7. Synthetic data options for training
8. Partnership/licensing data sources

## Output: Datasets Report

```
---
title: "Datasets & APIs: {Product Name / Domain}"
created: "{YYYY-MM-DD}"
domain: "{domain}"
geographic_scope: "{scope}"
tags:
  - datasets
  - {domain-tag}
  - {idea-slug}
---

# Datasets & APIs: {Product / Domain}

**Date:** {YYYY-MM-DD} | **Domain:** {domain} | **Scope:** {geographic}

---

## Quick Reference

| Category | Count Found | Best Source | Availability |
|----------|------------|-------------|--------------|
| Government/Public | {X} | {best one} | Free |
| Academic | {X} | {best one} | Free/Gated |
| Commercial APIs | {X} | {best one} | Freemium |
| Real-time Data | {X} | {best one} | Paid |

---

## Government & Public Sector Data

### {Country/Region} Government Sources

| Dataset | Provider | Coverage | Update Frequency | Access | URL |
|---------|----------|----------|-----------------|--------|-----|
| {Dataset name} | {Gov agency} | {what it covers} | {daily/weekly/annual} | Free | {url} |
| {Dataset name} | {Gov agency} | {coverage} | {frequency} | Free | {url} |
| {Dataset name} | {Gov agency} | {coverage} | {frequency} | Free download | {url} |

### International Organizations

| Dataset | Organization | Coverage | Access | URL |
|---------|-------------|----------|--------|-----|
| {Dataset} | {UN/World Bank/FAO/WHO/etc.} | {coverage} | Free API | {url} |
| {Dataset} | {Organization} | {coverage} | Free download | {url} |

---

## Domain-Specific Datasets

### {Primary Data Category for This Idea}

| Dataset | Source | Size | Format | License | URL |
|---------|--------|------|--------|---------|-----|
| {Dataset name} | {provider} | {X GB / X rows} | {CSV/JSON/API} | {CC0/MIT/restricted} | {url} |
| {Dataset name} | {provider} | {size} | {format} | {license} | {url} |
| {Dataset name} | {provider} | {size} | {format} | {license} | {url} |

### {Secondary Data Category}

| Dataset | Source | Size | Format | License | URL |
|---------|--------|------|--------|---------|-----|
| {Dataset name} | {provider} | {size} | {format} | {license} | {url} |
| {Dataset name} | {provider} | {size} | {format} | {license} | {url} |

---

## APIs with Free Tiers

### Essential APIs (Build the Core Product)

**{API Name}**
- **Purpose:** {what you'd use it for in this product}
- **Free tier:** {specific limits — X requests/day, X calls/month}
- **Paid plans:** From ${X}/month for {what}
- **Auth:** {API key / OAuth}
- **Quality:** {Excellent / Good / Variable}
- **URL:** {url}
- **Code example:**
```python
import requests
response = requests.get(
    "{api_endpoint}",
    params={"key": "YOUR_API_KEY", "param": "value"}
)
data = response.json()
```

**{API Name}**
- **Purpose:** {purpose in this product}
- **Free tier:** {limits}
- **Paid:** From ${X}/month
- **URL:** {url}

**{API Name}**
- **Purpose:** {purpose}
- **Free tier:** {limits}
- **Paid:** {pricing}
- **URL:** {url}

### Supporting APIs (Nice to Have)

| API | Purpose | Free Tier | Starting Price | URL |
|-----|---------|-----------|----------------|-----|
| {API} | {purpose} | {free tier} | ${X}/mo | {url} |
| {API} | {purpose} | {free tier} | ${X}/mo | {url} |
| {API} | {purpose} | {free tier} | ${X}/mo | {url} |
| {API} | {purpose} | {free tier} | ${X}/mo | {url} |

---

## Academic & Research Datasets

| Dataset | Institution | Paper/Source | Size | Access | URL |
|---------|------------|--------------|------|--------|-----|
| {Dataset} | {University/Research Lab} | {paper title if applicable} | {size} | Free download | {url} |
| {Dataset} | {Institution} | {paper} | {size} | Request-based | {url} |
| {Dataset} | {Institution} | {source} | {size} | Free | {url} |

**Key Academic Repository:** {Kaggle / Hugging Face / UCI ML Repository / other} — {specific collections relevant to this domain}

---

## Real-Time Data Sources

| Source | Data Type | Latency | Cost | Method |
|--------|-----------|---------|------|--------|
| {Source} | {type} | {ms/s/min} | {cost} | {WebSocket/REST/Webhook} |
| {Source} | {type} | {latency} | {cost} | {method} |
| {Source} | {type} | {latency} | {cost} | {method} |

---

## Web Scraping Opportunities (Legal)

### Scrapable Public Sources
> ⚠️ Always check robots.txt and Terms of Service before scraping. When in doubt, request an API or data partnership instead.

| Source | Data Available | Legal Status | Scraping Complexity | Notes |
|--------|---------------|--------------|---------------------|-------|
| {Website} | {what data} | {Public/Gray area} | {Easy/Medium/Hard} | {important note} |
| {Website} | {data} | {status} | {complexity} | {note} |

**Recommended scraping tools:** {Scrapy / Playwright / Apify} for this use case

---

## Open Source & Community Datasets

| Dataset | Platform | Stars/Downloads | Last Updated | URL |
|---------|----------|-----------------|-------------|-----|
| {Dataset} | {GitHub/Hugging Face/Kaggle} | {popularity metric} | {date} | {url} |
| {Dataset} | {platform} | {metric} | {date} | {url} |
| {Dataset} | {platform} | {metric} | {date} | {url} |

---

## Synthetic Data Strategy

For cases where real data is scarce, proprietary, or too expensive:

**Generate synthetic data using:**
- {Tool 1}: {what it generates and how to use it for this domain}
- {Tool 2}: {use case}
- {Approach}: {how to generate realistic synthetic data for this domain}

**When to use synthetic data:**
- Training ML models when real data < {X} examples
- Testing edge cases
- Privacy-preserving development

---

## Proprietary Data Acquisition Strategy

How to build your own proprietary dataset over time:

1. **User-generated data:** {what your users will generate that becomes a data asset}
2. **Behavioral signals:** {what usage patterns to capture that are valuable}
3. **Partnerships:** {who to partner with for data access — name specific types of companies}
4. **Data marketplace:** {if relevant — Snowflake Data Marketplace / AWS Data Exchange / others}
5. **Government contracts:** {if applicable to this domain}

**Your data moat:** {How the data you accumulate over 12 months becomes a competitive advantage}

---

## Data Pipeline Recommendations

### For MVP (Simple)
```
Raw Data → {cleaning tool} → {storage} → {your API} → Users
```

**Tools:** {Pandas + PostgreSQL OR Supabase OR Firebase} — {why this is enough for MVP}

### For Production (Scalable)
```
Sources → Ingestion ({Airbyte/Fivetran}) → Data Lake ({S3/GCS}) 
       → Transformation ({dbt}) → Warehouse ({BigQuery/Snowflake}) 
       → API Layer → Users
```

**Orchestration:** {Apache Airflow / Prefect / Dagster} — {recommendation based on team size}

---

## Data Quality & Freshness

| Dataset | Update Frequency | Quality Rating | Notes |
|---------|-----------------|----------------|-------|
| {Dataset} | {frequency} | ⭐⭐⭐⭐⭐ / {rating} | {quality note} |
| {Dataset} | {frequency} | {rating} | {note} |

**Data freshness requirement for this product:** {How often does your product need fresh data to deliver value?}

---

## Estimated Data Costs

| Source | Monthly Cost at MVP | Monthly Cost at Scale |
|--------|--------------------|-----------------------|
| {API} | ${X} (free tier) | ${X} |
| {API} | ${X} | ${X} |
| {Data purchase} | ${X} | ${X} |
| **Total** | **~${X}/month** | **~${X}/month** |

---

## Implementation Priority

### Start With (Week 1)
1. {Dataset/API 1} — {why start here, what it unlocks}
2. {Dataset/API 2} — {why essential immediately}

### Add Later (Month 2–3)
1. {Dataset/API} — {when you need it}
2. {Dataset/API} — {trigger condition}

### Explore When Scaling (Month 6+)
1. {Data source} — {when it makes sense}
2. {Data source} — {condition}

---

*Generated by Idea Dumpster · {YYYY-MM-DD} · `/find-datasets`*
```

---

## Post-Generation Actions

1. Save to `VAULT_PATH_PLACEHOLDER\Ideas\Datasets\{YYYY-MM-DD}-datasets-{slug}.md`
2. Highlight the top 3 most valuable data sources
3. Flag any legal concerns around data usage
