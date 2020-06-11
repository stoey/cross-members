import sys

DISTROS = {
    'ubuntu' : [
        '20.04', 'focal-20200423', 'focal', 'latest', 'rolling',
        '20.10', 'groovy-20200505', 'groovy', 'devel',
        '19.10', 'eoan-20200410', 'eoan',
        '18.04', 'bionic-20200403', 'bionic',
        '16.04', 'xenial-20200326', 'xenial',
        '14.04', 'trusty-20191217', 'trusty',
    ]
}

HEADER = (
"""version: "3.0"
services:"""
)


SERVICE_TEMPLATE = ("""
{distro}-{tag}:
  image: stoey/{image_name}:{distro}-{tag}
  build:
    context: .
    args:
      distro: "{distro}"
      tag: "{tag}"
""")

def indent(text, amount):
    lines = text.split('\n')
    space = " " * amount
    return '\n'.join((space + l for l in lines))

def service(distro, tag, image_name):
    context = dict(
        distro=distro,
        tag=tag,
        image_name=image_name
    )
    return indent(SERVICE_TEMPLATE.format(**context), 2)


def main(image_name):
    print(HEADER)
    for distro, tags in DISTROS.items():
        for tag in tags:
            print(service(distro, tag, image_name))

if __name__ == '__main__':
    image_name = 'cross-members'
    if len(sys.argv) > 1:
        image_name = sys.argv[1]

    main(image_name)
