while read line; do
  if [[ "$line" =~ ^([^=:]+)=(.+)$ ]]; then
    key="${BASH_REMATCH[1]}"
    valid_key=`echo $key | tr "." "_"`
    value="${BASH_REMATCH[2]}"
    export "$valid_key"=\"$value\"
  fi
done < "target/classes/version.properties"

# Use the created variables
echo "example.version: $example_version"
