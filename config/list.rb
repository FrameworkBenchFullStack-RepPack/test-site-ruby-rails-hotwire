module ListConfig
    FILTER_DEFAULTS = {
    sort: "name",
    age_from: 0,
    age_to: 100,
    page_num: 1
    }

    FILTER_LIMITS = {
    age_from: { min: 0, max: 100 },
    age_to: { min: 0, max: 100 },
    category: { min: 1, max: 2_000_000 },
    size: { min: 1, max: 1_000 },
    page_num: { min: 1, max: 2_000_000 }
    }
end
