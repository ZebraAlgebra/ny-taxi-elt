select * from ({{
  combined_cleaner(
    2018,
    1, 
    overides={
      "cbd_congestion_fee_usd": "NULL"
    }
  )
}})
union all 
select * from ({{
  combined_cleaner(
    2018,
    1, 
    overides={
      "cbd_congestion_fee_usd": "NULL"
    }
  )
}})
