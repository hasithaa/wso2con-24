import ballerina/io;

public function main() returns error? {
    // An XML element. There can be only one root element.
    xml x1 = xml `<book>The Lost World</book>`;
    io:println(x1);

    // An XML processing instruction.
    xml x2 = xml `<?target data?>`;
    io:println(x2);

    // An XML comment.
    xml x3 = xml `<!--I am a comment-->`;
    io:println(x3);

    // An XML text.
    xml x4 = xml `Hello, world!`;
    io:println(x4);

    // `xml:createText` can be used to convert a string to `xmlText`.
    string hello = "Hello";
    string world = "World";
    xml:Text xmlString = xml:createText(hello + " " + world);
    io:println(xmlString);

    // Creates an XML value.
    string author = "Sherlock Holmes";
    xml xmlValue = xml `<name>${author}</name>
                        <details>
                          <author>Sir Arthur Conan Doyle</author>
                          <language>English</language>
                        </details>`;

    // `x[i]` or `x.get(i)` gives the `i`-th item.
    io:println(xmlValue[0]);

    // `x.id` accesses a required attribute named `id`. The result is an `error` if there is no such
    // attribute or if `x` is not a singleton.
    xml xmlHello = xml `<para id="greeting">Hello</para>`;
    string id = check xmlHello.id;
    io:println(id);

    // `x?.id` accesses an optional attribute named `id`. The result is `()` if there is no such
    // attribute.
    string? name = check xmlHello?.name;
    io:println(name);

    xml xmlItems = xml
        `<items>
            <!--Contents-->
            <book>
                <name>A Study in Scarlet</name>
                <author><name>Arthur Conan Doyle</name></author>
            </book>
            <planner>Daily Planner<kind>day</kind><pages>365</pages></planner>
            <pen><kind>marker</kind><color>blue</color></pen>
        </items>`;

    // XML navigation.
    xml items = xmlItems/<book>;
    io:println(items);

}
